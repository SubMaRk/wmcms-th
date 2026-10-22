<?php
/**
* 管理员两步验证（TOTP）存储模型
*
* 表在第一次使用时自动创建，已有站点不需要跑升级脚本。
*
* @package        WMCMS
*/
class TwofaModel
{
	//表名
	public $table = '@manager_2fa';
	//表是否已经确认存在
	private static $tableReady = false;

	/**
	 * 确保表存在
	 */
	function __construct()
	{
		if( self::$tableReady )
		{
			return true;
		}
		wmsql::exec("CREATE TABLE IF NOT EXISTS `".C('config.db.prefix')."manager_2fa` (
			`manager_id` int(11) NOT NULL,
			`twofa_secret` varchar(64) NOT NULL DEFAULT '',
			`twofa_time` int(11) NOT NULL DEFAULT '0',
			PRIMARY KEY (`manager_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8");
		self::$tableReady = true;
	}

	/**
	 * 取得某个管理员的密钥
	 * @param 参数1，必须，管理员id
	 */
	function GetSecret( $managerId )
	{
		$where['table'] = $this->table;
		$where['where']['manager_id'] = (int)$managerId;
		$data = wmsql::GetOne($where);
		return ( is_array($data) && isset($data['twofa_secret']) ) ? $data['twofa_secret'] : '';
	}

	/**
	 * 保存密钥
	 * @param 参数1，必须，管理员id
	 * @param 参数2，必须，base32 密钥
	 */
	function SaveSecret( $managerId , $secret )
	{
		$where['manager_id'] = (int)$managerId;
		$exists = $this->GetSecret($managerId);
		$data['twofa_secret'] = (string)$secret;
		$data['twofa_time'] = time();
		if( $exists == '' )
		{
			$data['manager_id'] = (int)$managerId;
			return wmsql::Insert($this->table, $data);
		}
		return wmsql::Update($this->table, $data, $where);
	}

	/**
	 * 关闭两步验证
	 * @param 参数1，必须，管理员id
	 */
	function DeleteSecret( $managerId )
	{
		return wmsql::Delete($this->table, array('manager_id'=>(int)$managerId));
	}
}
?>
