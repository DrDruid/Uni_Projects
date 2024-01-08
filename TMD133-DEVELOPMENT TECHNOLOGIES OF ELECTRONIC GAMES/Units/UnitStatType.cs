using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RTS.FDG.Units
{
    public class UnitStatType : ScriptableObject
    {
       [System.Serializable]
       public class Base
       {
            public float cost, aggroRange, attackRange,attackSpeed, attack, health, armor, healing, dmgboost, armorboost;
       }
    }

}