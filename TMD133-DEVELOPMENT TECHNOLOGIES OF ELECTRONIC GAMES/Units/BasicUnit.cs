using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RTS.FDG.Units
{
    [CreateAssetMenu(fileName="New Unit", menuName="Create New Unit/Basic")]
    public class BasicUnit : ScriptableObject
    {
        

        public enum unitType
        {
            Peasant,
            Soldier,
            Sergeant,
            Elite,
            Command,
            Healer,
            Shooter,
            Hero,
            Hero1,
            Peasantorc,
            Soldierorc,
            Sergeantorc,
            Eliteorc,
            Commandorc,
            Healerorc,
            Shooterorc,
            Heroorc,
            Hero1orc,
        };
        [Space(10)]
        [Header("Unit Settings")]
        public unitType type;


        public new string name;

        public GameObject unitPrefab;

        public GameObject icon;
        public float spawnTime;
        
        //public GameObject possesedPrefab;
        [Space(10)]
        [Header("Unit Base Stats")]
        [Space(10)]

        public UnitStatType.Base baseStats;
         
    }
}


