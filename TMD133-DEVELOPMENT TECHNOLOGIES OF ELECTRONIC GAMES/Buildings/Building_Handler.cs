using UnityEngine;

namespace RTS.FDG.Buildings
{
    public class Building_Handler : MonoBehaviour
    {
        public static Building_Handler instance;

        [SerializeField]
        private BasicBuilding barracks,
            townhall,
            deffenceTower,
            watchtower,
            farm,
            altar,
            fortress,
            mine;

        private void Awake()
        {
            instance = this;
        }

        public BuildingStatType.Base GetBasicBuildingStats(string type)
        {
            BasicBuilding building;

            switch (type)
            {
                case "barrack":
                    building = barracks;
                    break;
                default:
                    Debug.Log($"Unit Type: {type} could not be found or does not exist");
                    return null;
            }
            return building.baseStats;

        }
    }
}
