<!--
#Include "Libs/Nadeo/CMGame/Utils/Icons.Script.txt" as Icons
#Include "TextLib" as TextLib

CSmPlayer GetNextSpawnedPlayer() {
    if (GUIPlayer == Null) return Null;

    declare CSmPlayer TargetPlayer;
    declare Boolean CanSelectNextPlayer = False;

    foreach (Player in Players) {
        if (Player == GUIPlayer) {
            CanSelectNextPlayer = True;
        } else if (
            Player.SpawnStatus != CSmPlayer::ESpawnStatus::NotSpawned &&
            Player.User != Null
        ) {
            if (CanSelectNextPlayer) {
                TargetPlayer <=> Player;
                break;
            } else if (TargetPlayer == Null) {
                TargetPlayer <=> Player;
            }
        }
    }
    return TargetPlayer;
}

CSmPlayer GetPrevSpawnedPlayer() {
    if (GUIPlayer == Null) return Null;

    declare CSmPlayer TargetPlayer;
    declare Boolean CanSelectPrevPlayer = False;

    // Read the Players array in the reverse order to fin the previous spawned player
    for (I, 0, Players.count-1, -1) {
        declare CSmPlayer Player <=> Players[I];
        if (Player == GUIPlayer) {
            CanSelectPrevPlayer = True;
        } else if (
            Player.SpawnStatus != CSmPlayer::ESpawnStatus::NotSpawned &&
            Player.User != Null
        ) {
            if (CanSelectPrevPlayer) {
                TargetPlayer <=> Player;
                break;
            } else if (TargetPlayer == Null) {
                TargetPlayer <=> Player;
            }
        }
    }

    return TargetPlayer;
}

Void AnimateOpacity(CMlLabel button, Real targetOpacity){
    AnimMgr.Flush(button);
    AnimMgr.Add(button, "<anim opacity=\"" ^ targetOpacity ^ "\"/>", 200, CAnimManager::EAnimManagerEasing::ExpOut);
}

Void AnimatePop(CMlLabel button){
    AnimMgr.Flush(button);
    AnimMgr.Add(button, "<anim scale=\"1.2\" opacity=\"1.0\"/>", 200, CAnimManager::EAnimManagerEasing::ExpOut);
    AnimMgr.AddChain(button, "<anim scale=\"1.0\" opacity=\"0.5\"/>", 200, CAnimManager::EAnimManagerEasing::ExpOut);
}

Void FocusPlayer(CSmPlayer _Player) {
    if (_Player != Null && _Player.SpawnStatus != CSmPlayer::ESpawnStatus::NotSpawned && _Player.User != Null) {
        SetSpectateTarget(_Player.User.Login);
    }
}

Text SpecPrevious(CMlLabel button, Boolean focus){
    AnimatePop(button);
    declare CSmPlayer target <=> GetNextSpawnedPlayer();
    if(focus){
        FocusPlayer(target);
    }
    return target.User.Login;
}

Text SpecNext(CMlLabel button, Boolean focus){
    AnimatePop(button);
    declare CSmPlayer target <=> GetNextSpawnedPlayer();
    if(focus){
        FocusPlayer(target);
    }
    return target.User.Login;
}

main() {
    declare mainFrame <=> (Page.MainFrame.GetFirstChild("main_frame") as CMlFrame);
    declare previousButton <=> (Page.MainFrame.GetFirstChild("left_button") as CMlLabel);
    declare nextButton <=> (Page.MainFrame.GetFirstChild("right_button") as CMlLabel);
    declare targetLogin = "{{ playerLogin }}";
    
    while(True){
        yield;
        
        if(GUIPlayer == Null){
            if(mainFrame.Visible){
                mainFrame.Hide();
            }
            continue;
        }
        
        if(!mainFrame.Visible){
            mainFrame.Show();
        }
        
        foreach (InputEvent in Input.PendingEvents) {
            if(InputEvent.Button == CInputEvent::EButton::Left){
                SpecPrevious(previousButton, InputEvent.Pad.Type == CInputPad::EPadType::Keyboard);
                continue;
            }
            if(InputEvent.Button == CInputEvent::EButton::Right){
                SpecNext(nextButton, InputEvent.Pad.Type == CInputPad::EPadType::Keyboard);
                continue;
            }
        }
        
        foreach(Event in PendingEvents){
            if(Event.Type == CMlScriptEvent::Type::MouseClick){
                if(Event.Control == previousButton){
                    targetLogin = SpecPrevious(previousButton, True);
                    continue;
                }else if(Event.Control == nextButton){
                    targetLogin = SpecNext(nextButton, True);
                    continue;
                }
            }
            if(Event.Type == CMlScriptEvent::Type::MouseOver){
                AnimateOpacity(Event.Control as CMlLabel, 1.0);
                continue;
            }
            if(Event.Type == CMlScriptEvent::Type::MouseOut){
                AnimateOpacity(Event.Control as CMlLabel, 0.5);
                continue;
            }
        }
    }
}
-->