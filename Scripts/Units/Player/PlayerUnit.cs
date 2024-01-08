using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;



namespace RTS.FDG.Units.Player
{
    [RequireComponent(typeof(NavMeshAgent))]
    public class PlayerUnit : MonoBehaviour
    {
        public NavMeshAgent agent;

        public UnitStatType.Base baseStats;

        private  void onEnable()
        {
            agent = GetComponent<NavMeshAgent>();
            
        }
        public void MoveUnit(Vector3 destination)
        {
            agent.SetDestination(destination);
        }

       

       

        
    }
}

