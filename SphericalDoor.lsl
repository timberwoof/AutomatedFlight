integer gLoopsteps = 5;
float gSoundVolume = 0.5;


float gDoorDelta; // (gDoorOpenCut - gDoorClosedCut) / gLoopsteps;
string gDoorSound = "B5door";
string gDoorState;

vector closedPosition = <0,0,345>;
vector openPosition = <0,0,300>;

float closedAngle = 0;
float openAngle = 75;


open_door() {
    if (gDoorState != "OPEN")
    {
        float doorAngle; 
        llPlaySound(gDoorSound,gSoundVolume);
        for (doorAngle = closedAngle; doorAngle <= openAngle; doorAngle += gDoorDelta) {
            llSetLocalRot(llEuler2Rot(<0,doorAngle,270>*DEG_TO_RAD));
        }
        gDoorState = "OPEN";
    }
    llMessageLinked(LINK_ROOT, 1, "Hatch", "");
}

close_door() {
    if (gDoorState != "CLOSED")
    {
        llPlaySound(gDoorSound,gSoundVolume);
        float doorAngle; 
        for (doorAngle = openAngle; doorAngle >= closedAngle; doorAngle -= gDoorDelta) {
            llSetLocalRot(llEuler2Rot(<0,doorAngle,270>*DEG_TO_RAD));
        }
        gDoorState = "CLOSED";
    }    
    llMessageLinked(LINK_ROOT, 0, "Hatch", "");
}



default
{
    state_entry(){
        gDoorDelta = (openAngle - closedAngle) / gLoopsteps;
        gDoorState = "CLOSED";
        llSetLocalRot(llEuler2Rot(<0,closedAngle,270>*DEG_TO_RAD));
    }
    
    link_message(integer Sender, integer Number, string String, key Key) // This script is in the object too.
    {
        string message = (string)Sender + String + (string)Number;
        if (String == "Open Hatch") {
            open_door();
        }
        if (String == "Close Hatch") {
            close_door();
        }
    }
}
