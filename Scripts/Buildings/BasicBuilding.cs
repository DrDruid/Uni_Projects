using UnityEngine;

namespace RTS.FDG.Buildings
{
    [CreateAssetMenu(fileName = "Building", menuName = "Newbuilding/Basic")]
    public class BasicBuilding : ScriptableObject
    {
        public enum buildingType
        {
            Barracks,
            Townhall,
            DeffenceTower,
            Watchtower,
            Farm,
            Altar,
            Fortress,
            Mine

        };
        [Space(10)]
        [Header("Building Settings")]

        public buildingType type;
        public new string name;
        public GameObject buildingPrefab;
        public GameObject icon;
        public float spawnTime;

        
        
        [Space(10)]
        [Header("Building Base Stats")]
        [Space(10)]
        public BuildingStatType.Base baseStats;


    }

}