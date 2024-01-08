using UnityEngine;

namespace RTS.FDG.Interactable
{
    public class IBuilding : Interactable
    {
        public UI.HUD.PlayerActions actions;
        public override void OnInteractEnter()
        {
            UI.HUD.ActionFrame.instance.SetActionButton(actions,gameObject);
            base.OnInteractEnter();
        }

        public override void OnInteractExit()
        {
            UI.HUD.ActionFrame.instance.ClearActions();
            base.OnInteractExit();
        }
    }

}
