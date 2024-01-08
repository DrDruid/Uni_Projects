using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RTS.FDG.UI.HUD
{
    [CreateAssetMenu(fileName ="NewPlayerActions",menuName ="PlayerActions")]
    public class PlayerActions : ScriptableObject
    {
        [Space(10)]
        [Header("Units")]
        public List<Units.BasicUnit>basicUnits = new List<Units.BasicUnit>();
        [Space(10)]
        [Header("Buildings")]
        [Space(10)]
        public List<Buildings.BasicBuilding> basicBuildings = new List<Buildings.BasicBuilding>();
        
    }

}