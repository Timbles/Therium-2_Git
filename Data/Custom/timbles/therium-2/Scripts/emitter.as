void Init() {
}

float frequency = 0.05f;
vec3 col = vec3(1.0f);
float delay = frequency;
string path = "Data/Particles/smoke_ambient.xml";
 
void SetParameters() {
	
	params.AddString("path", "Data/Particles/smoke_ambient.xml");
	path = params.GetString("path");
	
	params.AddFloatSlider("frequency", 50.0f, "min:0.0,max:500.0");
    frequency = (params.GetFloat("frequency"))/1000.0f;
	
	params.AddFloatSlider("color red", 256.0f, "min:0.0,max:256.0");
	col.x = params.GetFloat("color red")/256;
	params.AddFloatSlider("color green",256.0f, "min:0.0,max:256.0");
	col.y = params.GetFloat("color green")/256;
	params.AddFloatSlider("color blue", 256.0f, "min:0.0,max:256.0");
	col.z = params.GetFloat("color blue")/256;
	
}

void Update() {
    Object@ obj = ReadObjectFromID(hotspot.GetID());
    vec3 pos = obj.GetTranslation();
    vec3 scale = obj.GetScale();
    vec4 v = obj.GetRotationVec4();
    quaternion rotation(v.x,v.y,v.z,v.a);
    delay -= time_step;
    if(delay <= 0.0f){
        for(int i=0; i<1; ++i){
            vec3 offset;
            offset.x += RangedRandomFloat(-scale.x*2.0f,scale.x*2.0f);
            offset.y += RangedRandomFloat(-scale.y*2.0f,scale.y*2.0f);
            offset.z += RangedRandomFloat(-scale.z*2.0f,scale.z*2.0f);
            uint32 id = MakeParticle(path,pos + Mult(rotation, offset),vec3(0.0f),col);
									//what particle //init speed maybe?
        delay += frequency;
		}
    }
}