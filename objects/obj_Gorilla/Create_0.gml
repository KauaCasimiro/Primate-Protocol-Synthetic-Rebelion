vspd = 0;
hspd = 0;
dir = 0;
velocity = 4;

state = "idle";

can_shoot = true;
shoot_cooldown = 15;
shoot_timer = 0

is_stunned = false;
stun_timer = 0;
stun_effect_intensity = 0;

hp_Max = 100;
hp = hp_Max;
hp_Gerency = new scr_Hp(hp_Max);

energy_Max = 100;
energy = energy_Max;
energy_Gerency = new scr_Energy(energy_Max);

damage_effect_timer = 0;
damage_effect_duration = 15;

global.total_shots = 0;
global.hits = 0;
global.current_combo = 0;
global.max_combo = 0;

global.last_shot_time = 0;
global.shot_intervals = [];

is_dead = false;
flash_timer = 0;      
freeze_timer = 0;     

