using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RTS.FDG.InputManager;



namespace RTS.FDG.Player
{
    public class Player_Manager : MonoBehaviour
    {
        public static Player_Manager instance;

        public Transform playerUnits;
        public Transform enemyUnits;

        public Transform playerBuilding;

        private void Awake()
        {
            instance = this;
            SetBasicStats(playerUnits);
            SetBasicStats(enemyUnits);
            SetBasicStats(playerBuilding);
        }
        public void SetBasicStats(Transform type)
        {
            

            foreach (Transform child in type)
            {
                foreach (Transform tf in child)
                {
                    string name = child.name.Substring(0, child.name.Length - 1).ToLower();
                    //var stats = Units.Unit_Handler.instance.GetBasicUnitStats(unitName);

                    if (type == playerUnits)
                    {
                        Units.Player.PlayerUnit pU = tf.GetComponent<Units.Player.PlayerUnit>();

                        pU.baseStats = Units.Unit_Handler.instance.GetBasicUnitStats(name);
                    }
                    else if (type == enemyUnits)
                    {
                        Units.Enemy.EnemyUnit eU = tf.GetComponent<Units.Enemy.EnemyUnit>();

                        eU.baseStats = Units.Unit_Handler.instance.GetBasicUnitStats(name);
                    }
                    else if(type==playerBuilding)
                    {
                        Buildings.Player.PlayerBuilding  pb= tf.GetComponent<Buildings.Player.PlayerBuilding>();
                        pb.baseStats = Buildings.Building_Handler.instance.GetBasicBuildingStats(name);
                    }




                }
            }
        }


        private void Update()
        {
            Input_Handler.instance.HandleUnitMovement();
        }
    }

}

