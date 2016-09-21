

mvn install -Dmaven.test.skip=true


-- tomcatÄÚ´æÒç³ö
-Xms512m -Xmx1024m -XX:PermSize=128M -XX:MaxNewSize=512m -XX:MaxPermSize=256m

-- ÅÜÅú

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


taskkill /f /t /im java.exe




stage: zhujiwei_test1 qwer1234

