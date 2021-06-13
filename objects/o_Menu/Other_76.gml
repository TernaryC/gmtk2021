/// @description 

if (event_data[? "event_type"] != "sprite event") return;
if (event_data[? "message"] == "RestartRoom") {
    wiping = true;
    restart = true;
}