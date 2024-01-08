using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RTS.FDG.Player;

namespace RTS.FDG.Units
{  
    public class Unit_Handler : MonoBehaviour
    {
        public static Unit_Handler instance;
        [SerializeField]
        private BasicUnit peasant, soldier, sergeant, elite, command, healer, shooter, hero,hero1, peasantorc, soldierorc, sergeantorc, eliteorc, commandorc, healerorc, shooterorc, heroorc, hero1orc;
        
        public LayerMask pUnitLayer, eUnitLayer;
        private void Awake()
        {
            instance = this;
        }
        public UnitStatType.Base GetBasicUnitStats(string type)
        {
            BasicUnit unit;
            switch (type)
            {
                case "peasant":
                    unit = peasant;
                    break;
                case "soldier":
                    unit = soldier;
                    break;
                case "sergeant":
                    unit = sergeant;
                    break;
                case "elite":
                    unit = elite;
                    break;
                case "command":
                    unit = command;
                    break;
                case "healer":
                    unit = healer;
                    break;
                case "shooter":
                    unit = shooter;
                    break;
                case "hero":
                    unit = hero;
                    break;
                case "hero1":
                    unit = hero1;
                    break;
                case "peasantorc":
                    unit = peasantorc;
                    break;
                case "soldierorc":
                    unit = soldierorc;
                    break;
                case "sergeantorc":
                    unit = sergeantorc;
                    break;
                case "eliteorc":
                    unit = eliteorc;
                    break;
                case "commandorc":
                    unit = commandorc;
                    break;
                case "healerorc":
                    unit = healerorc;
                    break;
                case "shooterorc":
                    unit = shooterorc;
                    break;
                case "heroorc":
                    unit = heroorc;
                    break;
                case "hero1orc":
                    unit = hero1orc;
                    break;
                default:
                    Debug.Log($"Unit Type: {type} could not be found or does not exist");
                    return null;
            }
            return unit.baseStats;
        }
    }
}


