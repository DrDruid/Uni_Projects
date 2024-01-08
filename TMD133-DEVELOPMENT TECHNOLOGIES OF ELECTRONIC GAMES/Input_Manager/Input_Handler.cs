using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RTS.FDG.Units.Player;
using UnityEngine.EventSystems;

namespace RTS.FDG.InputManager
{
    public class Input_Handler : MonoBehaviour
    {
        public static Input_Handler instance;

        private RaycastHit hit;

        public List<Transform> selectedUnits = new List<Transform>();
        public Transform selectedBuilding = null;

        public LayerMask interactableLayer = new LayerMask();

        private bool isDragging = false;

        private Vector3 mousePos;
        
        private void Awake()
        {
            instance = this;
        }
        private void OnGUI()
        {
            if (isDragging)
            {
                Rect rect = MultiSelect.GetScreenRect(mousePos, Input.mousePosition);
                MultiSelect.DrawScreenRec(rect, new Color(0f, 0f, 0f, 0.25f));
                MultiSelect.DrawScreenRecBorder(rect, 3, Color.blue);
            }
        }
        public void HandleUnitMovement()
        {
           
            if(Input.GetMouseButtonDown(0))
            {
                if (EventSystem.current.IsPointerOverGameObject())
                {
                    return;
                }
                mousePos = Input.mousePosition;
                Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                if(Physics.Raycast(ray, out hit, 100, interactableLayer)) 
                {
                    if(addedUnit(hit.transform, Input.GetKey(KeyCode.LeftShift)))
                    {
                        //be able t odo stuff with unit
                    }
                    else if(addedBuilding(hit.transform))
                    {
                        //be able to stuff with bulding
                    }

                }
                else
                {
                    isDragging = true;
                    DeselectUnit();
                }

            }
            if(Input.GetMouseButtonUp(0))
            {
                
                foreach(Transform child in Player.Player_Manager.instance.playerUnits)
                {
                     foreach(Transform unit in child)
                    {
                        if (isWithinRectBox(unit))
                        {
                            addedUnit(unit, true);
                        }
                        
                    }
                }
                isDragging = false;
            }
            if(Input.GetMouseButtonDown(1) && HaveSelectdUnits())
            {
                
                Ray ray= Camera.main.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out hit))
                {
                    LayerMask layerHit = hit.transform.gameObject.layer;

                    switch (layerHit.value)
                    {
                        case 8:
                            //do somehting
                            break;
                        case 9:
                            //eneym
                            break;
                        default:
                            foreach(Transform unit in selectedUnits)
                            {
                                PlayerUnit pU = unit.gameObject.GetComponent<PlayerUnit>();
                                pU.MoveUnit(hit.point);
                            }
                            break;

                    }

                }
            }
        }

        
        private void DeselectUnit()
        {
            if(selectedBuilding)
            {
                selectedBuilding.gameObject.GetComponent<Interactable.IBuilding>().OnInteractExit();
                selectedBuilding = null;            
            }
            for (int i = 0; i < selectedUnits.Count; i++)
            {
                selectedUnits[i].gameObject.GetComponent<Interactable.IUnit>().OnInteractExit();
            }
            selectedUnits.Clear();
        }

        private bool isWithinRectBox(Transform draggedbox)
        {
            if(!isDragging)
            {
                return false;
            }
            Camera camera = Camera.main;
            Bounds iBounds = MultiSelect.GetViewBounds(camera, mousePos, Input.mousePosition);
            return iBounds.Contains(camera.WorldToViewportPoint(draggedbox.position));
        }

        private bool HaveSelectdUnits()
        {
            if (selectedUnits.Count>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private Interactable.IUnit addedUnit(Transform tf, bool canMultiSelect=false)
        {
            Interactable.IUnit iUnit = tf.GetComponent<Interactable.IUnit>();
            if(iUnit)
            {
                if(!canMultiSelect)
                {
                    DeselectUnit();
                }

                selectedUnits.Add(iUnit.gameObject.transform);
                iUnit.OnInteractEnter();
                return iUnit;
            }
            else
            {
                return null;
            }
        }
        private Interactable.IBuilding addedBuilding(Transform tf)
        {
            Interactable.IBuilding iBuilding = tf.GetComponent<Interactable.IBuilding>();
            if(iBuilding)
            {
                DeselectUnit();

                selectedBuilding = iBuilding.gameObject.transform;
                iBuilding.OnInteractEnter();
                return iBuilding;
            }
            else
            {
                return null;
            }
        }

       

    }


}