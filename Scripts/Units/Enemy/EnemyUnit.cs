using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

namespace RTS.FDG.Units.Enemy
{
    [RequireComponent(typeof(NavMeshAgent))]

    public class EnemyUnit : MonoBehaviour
    {
        public NavMeshAgent agent;

        public UnitStatType.Base baseStats;

        private Collider[] rangeColliders;
        private Transform aggroTarget;
        private UnitStatsDisplay aggroUnit;
        private bool hasAggro = false;
        private float distance;

        public float attackCooldown;

        private void Start()
        {
            agent = gameObject.GetComponent<NavMeshAgent>();
            
        }
        private void Update()
        {
            attackCooldown -= Time.deltaTime;

            if(!hasAggro)
            {
                CheckForEnemyTargets();

            }
            else
            {
                
                MoveToAggroTarget();
                Attack();


            }
        }
       

        private void CheckForEnemyTargets()
        {
            rangeColliders = Physics.OverlapSphere(transform.position, baseStats.aggroRange, Unit_Handler.instance.pUnitLayer);
            for (int i = 0; i < rangeColliders.Length;)
            {
                aggroTarget = rangeColliders[i].gameObject.transform;
                aggroUnit = aggroTarget.gameObject.GetComponentInChildren<UnitStatsDisplay>();
                hasAggro = true;
                break;
            }
        }
        private void Attack()
        {
            if ((attackCooldown<=0)&& (distance <= baseStats.attackRange + 1))
            {
                aggroUnit.TakeDamage(baseStats.attack);
                attackCooldown = baseStats.attackSpeed;

            }
        }

      

        private void MoveToAggroTarget()
        {
            if (aggroTarget==null)
            {
                agent.SetDestination(transform.position);
                hasAggro = false;
            }
            else
            {
                distance = Vector3.Distance(aggroTarget.position, transform.position);
                agent.stoppingDistance = (baseStats.attackRange + 1);

                if (distance <= baseStats.aggroRange)
                {
                    agent.SetDestination(aggroTarget.position);
                }
            }
        }

     
    }
}

