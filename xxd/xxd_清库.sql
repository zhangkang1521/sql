-- 散标
truncate table xxd_borrow;
truncate table XXD_BORROW_TENDER;
truncate table XXD_BORROW_REPAYMENT;
truncate table XXD_BORROW_COLLECTION;
truncate table XXD_BORROW_FEE;
truncate table XXD_BORROW_LATERINTEREST;
truncate table XXD_BORROW_OFFLINEREPAY;

-- 债权
truncate table XXD_TRADE_REQUEST;
truncate table XXD_TRADE_PACK;

-- 新元宝
truncate table  XXD_OPTIMIZE_SCHEME;
truncate table  XXD_OPTIMIZE_USERSCHEME;
truncate table  XXD_OPTIMIZE_USERDETAIL;

-- 日日盈
truncate table  xxd_fund_usertrade;
truncate table xxd_fund_usertotal;

-- 步步高升
truncate table xxd_step_join;


-- 理财业绩
truncate table xxd_offline_performance;
-- truncate table xxd_vip_appro

-- 消息
truncate table xxd_redis_msg;
truncate table xxd_message_site_sendlogs;

-- 跑批
delete from qrtz_fired_triggers;
delete from qrtz_simple_triggers;
delete from qrtz_simprop_triggers;
delete from qrtz_cron_triggers;
delete from qrtz_blob_triggers;
delete from qrtz_triggers;
delete from qrtz_job_details;
delete from qrtz_calendars;
delete from qrtz_paused_trigger_grps;
delete from qrtz_locks;
delete from qrtz_scheduler_state;

-- 新手标
delete from xxd_xxbao_borrow where btype=2