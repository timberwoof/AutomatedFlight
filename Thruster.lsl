particles(float Number) {
    // number ranges from 0 to 10
integer part_count = (integer)Number + 5; //10 to 30 
float speed_min = Number * 0.2 + 1.0; // 1 to 3
float speed_max = Number * 0.5 + 2.0; // 2 to 5
float age = Number * .2 + 0.1; // 0 to 2
float endscale = Number + 0.5; // .5 to 1.5

//llSay(0,(string)part_count+" "+(string)speed_min+" "+(string)speed_max+" "+(string)age+" "+(string)endscale);

    llParticleSystem([
PSYS_PART_FLAGS, 275,
PSYS_SRC_PATTERN, 8, 
PSYS_PART_START_ALPHA, 1.000000,
PSYS_PART_END_ALPHA, 1.000000,
PSYS_PART_START_COLOR, <1.000000, 1.000000, 0.000000>,
PSYS_PART_END_COLOR, <1.000000, 0.000000, 0.000000>,
PSYS_PART_START_SCALE, <0.05000, 0.05000, 0.00000>,
PSYS_PART_END_SCALE, <endscale, endscale, 0.0>, 
PSYS_PART_MAX_AGE, 0.5,
PSYS_SRC_MAX_AGE, 0.5,
PSYS_SRC_ACCEL, <0.000000, 0.000000, 0.000000>,
PSYS_SRC_ANGLE_BEGIN, 0.000000,
PSYS_SRC_ANGLE_END, 0.000000,
PSYS_SRC_BURST_PART_COUNT, part_count,
PSYS_SRC_BURST_RATE, 0.160000,
PSYS_SRC_BURST_RADIUS, 0.000000,
PSYS_SRC_BURST_SPEED_MIN, speed_min,
PSYS_SRC_BURST_SPEED_MAX, speed_max,
PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>,
PSYS_SRC_TARGET_KEY,(key)"", 
PSYS_SRC_TEXTURE, ""]);
}

stop_particles(){
    llParticleSystem([]);
}


default
{
    state_entry()
    {
        stop_particles();
    }

    link_message(integer Sender, integer Number, string String, key Key) // This script is in the object too.
    {
        vector erot = <0,0,0>;
        // this is the RIGHT one
        if (llSubStringIndex("fwd back down up LEFT right left", String) >= 0) {   
            if ("fwd" == String) {
                erot = <0,270,0>;
            }
            if ("back" == String) {
                erot = <0,90,0>;
            }
            if ("down" == String) {
                erot = <0,0,0>;
            }
            if ("up" == String) {
                erot = <180,0,0>;
            }
            if ("LEFT" == String) {
                erot = <90,0,0>;
            }
            //if ("RIGHT" == String) {
            //    erot = <270,0,0>;
            //}
            if ("right" == String) {
                erot = <0,90,0>;
            }
            if ("left" == String) {
                erot = <0,270,0>;
            }
         
             llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_ROT_LOCAL, llEuler2Rot(erot*DEG_TO_RAD)]);
            
            particles(Number);
        } else {
            stop_particles();
        }
    }
}
