<flat-profile>
    <Upgrade_Enable>Yes</Upgrade_Enable>
    <Upgrade_Error_Retry_Delay>60</Upgrade_Error_Retry_Delay>
    <Upgrade_Rule>tftp://172.17.1.1/fw/$PN/latest.bin</Upgrade_Rule>
    <Syslog_Server>172.17.1.1</Syslog_Server>
    <Provision_Enable>Yes</Provision_Enable>
    <Resync_Random_Delay>5</Resync_Random_Delay>
    <Resync_Periodic>5</Resync_Periodic>
    <Forced_Resync_Delay>5</Forced_Resync_Delay>
    <Resync_After_Upgrade_Attempt>Yes</Resync_After_Upgrade_Attempt>
    <Resync_Error_Retry_Delay>60</Resync_Error_Retry_Delay>
    <Profile_Rule>tftp://172.17.1.1/linksys.cfg<;/Profile_Rule>
        <Profile_Rule_B>https://10.1.1.1:9443/provision.cgi?PN=$PN&MAC=$MAC&SN=$SN</Profile_Rule_B>
</flat-profile> 
