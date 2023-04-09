global function ClPilotSpeedometer_Init

struct
{
	var rui = null
	bool useMetric
} file

void function SRM_Speedometer_Init()
{
	if ( GetConVarString( "password" ) == "metric" || GetConVarString( "password" ) == "units" )
	{
		file.useMetric = true
	}
	else if ( GetConVarString( "password" ) == "imperial" )
	{
		file.useMetric = false
	}

	if (SRMM_getSetting(SRMM_settings.enableSpeedometer)) {
		AddCreatePilotCockpitCallback( CreatePilotSpeedometer )
	} else return
}

void function SRM_CreateSpeedometer( entity cockpit, entity player )
{
	//file.rui = CreateTitanCockpitRui( $"ui/pilot_speedometer.rpak" )
	file.rui = CreatePermanentCockpitRui( $"ui/pilot_speedometer.rpak" )

	RuiSetBool( file.rui, "useMetric", file.useMetric )
	RuiSetGameTime( file.rui, "startTime", Time() )
	RuiTrackFloat3( file.rui, "playerPos", player, RUI_TRACK_ABSORIGIN_FOLLOW )

	player.EndSignal( "OnDeath" )
	//cockpit.EndSignal( "OnDestroy" )

	OnThreadEnd(
		function() : (  )
		{
			DestroyPilotSpeedometer()
		}
	)

	WaitForever()
}

void function DestroyPilotSpeedometer()
{
	if ( file.rui == null )
		return

	RuiDestroyIfAlive( file.rui )
	file.rui = null
}