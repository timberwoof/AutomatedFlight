key star = "db31faf4-d9a4-a9eb-1b4b-7f318c0fd4f2";

float rate = 2;

flash() {
llParticleSystem([
PSYS_PART_FLAGS, 464,
PSYS_SRC_PATTERN, 1, 
PSYS_PART_START_ALPHA, 1.000000,
PSYS_PART_END_ALPHA, 1.000000,
PSYS_PART_START_COLOR, <1.000000, 0.000000, 0.000000>,
PSYS_PART_END_COLOR, <1.000000, 1.000000, 1.000000>,
PSYS_PART_START_SCALE, <4.000000, 4.000000, 0.00000>,
PSYS_PART_END_SCALE, <4.000000, 4.000000, 0.00000>,
PSYS_PART_MAX_AGE, 0.100000,
PSYS_SRC_MAX_AGE, 0.000000,
PSYS_SRC_ACCEL, <0.000000, 0.000000, 0.000000>,
PSYS_SRC_ANGLE_BEGIN, 0.000000,
PSYS_SRC_ANGLE_END, 0.000000,
PSYS_SRC_BURST_PART_COUNT, 1,
PSYS_SRC_BURST_RATE, rate,
PSYS_SRC_BURST_RADIUS, 0.000000,
PSYS_SRC_BURST_SPEED_MIN, 0.000000,
PSYS_SRC_BURST_SPEED_MAX, 0.000000,
PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>,
PSYS_SRC_TARGET_KEY,llGetKey(), 
PSYS_SRC_TEXTURE, star]);
    }

on() {
    llSetColor(<1.0, 0.0, 0.0>, ALL_SIDES);
    flash();
}

off() {
    llParticleSystem([]);
    llSetColor(<0.5, 0.0, 0.0>, ALL_SIDES);
}


default
{
    state_entry()
    {
       on();
       llSleep(20);
       off();
    }
        

    link_message(integer Sender, integer Number, string message, key Key)
    {
        if (message == "Power On") {
            on();
        } else if (message == "Power Off") {
            off();
        }
    }
}
