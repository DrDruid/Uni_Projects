using UnityEngine;

namespace RTS.FDG.Buildings
{
    public class BuildingStatType : ScriptableObject
    {
      [System.Serializable]
      public class Base
        {
            public float health, armor, attack, attackRange, viewRange, healRange;
        }

    }
}

