void Init() {
}

string _default_path = "NOW PLAY THE CAMPAIGN!";

void SetParameters() {
    params.AddString("Level to load", _default_path);
}

void HandleEvent(string event, MovementObject @mo){
    if(event == "enter"){
        OnEnter(mo);
    } else if(event == "exit"){
        OnExit(mo);
    }
}

void OnEnter(MovementObject @mo) {
    {
        string path = params.GetString("Level to load");
        if(path != _default_path){
            level.SendMessage("loadlevel \""+path+"\"");
        } else {
            level.SendMessage("loadlevel \""+path+"\"");
        }
    }
}

void OnExit(MovementObject @mo) {
    if(mo.controlled){
        level.SendMessage("cleartext");
    }
}