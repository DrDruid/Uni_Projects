using UnityEngine;

namespace RTS.FDG.Interactable
{
    public class Interactable : MonoBehaviour
    {
        public bool isInteracting = false;
        public GameObject HighLight = null;
        public virtual void Awake()
        {
            HideHighlight();
        }
        public virtual void OnInteractEnter()
        {
            ShowHighlight();
            isInteracting = true;
        }
        public virtual void OnInteractExit()
        {
            HideHighlight();
            isInteracting = false;
        }
        public virtual void ShowHighlight()
        { 
            HighLight.SetActive(true);
        }
        public virtual void HideHighlight()
        {
            HighLight.SetActive(false);
        }
    }
}

