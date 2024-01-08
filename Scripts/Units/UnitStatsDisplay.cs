using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;



namespace RTS.FDG.Units
{
    public class UnitStatsDisplay : MonoBehaviour
    {
        public float maxHealth, armor, currentHealth,armorboost;

        [SerializeField] private Image healthBarAmount;
        private bool isPlayerUnit = false;
        private void Start()
        {
            try
            {
                maxHealth = gameObject.GetComponentInParent<Player.PlayerUnit>().baseStats.health;
                armor= gameObject.GetComponentInParent<Player.PlayerUnit>().baseStats.armor;
                armorboost= gameObject.GetComponentInParent<Player.PlayerUnit>().baseStats.armorboost;
                isPlayerUnit = true;

            }
            catch(Exception)
            {
                Debug.Log("No player Unit. Trying enemy unit...");
                try
                {
                    maxHealth = gameObject.GetComponentInParent<Enemy.EnemyUnit>().baseStats.health;
                    armor = gameObject.GetComponentInParent<Enemy.EnemyUnit>().baseStats.armor;
                    armorboost=gameObject.GetComponentInParent<Player.PlayerUnit>().baseStats.armorboost;
                    isPlayerUnit = false;
                }
                catch(Exception)
                {
                    Debug.Log("No Unit Scripts found!");
                }
            }
            currentHealth = maxHealth;
        }
        private void Update()
        {
            HandleHealth();
        }

        public void TakeDamage(float damage)
        {
            float totalDamage = damage - (armor / 100 + armorboost / 100);
            currentHealth -= totalDamage;
        }
        private void HandleHealth()
        {
            Camera camera = Camera.main;
            gameObject.transform.LookAt(gameObject.transform.position +
                camera.transform.rotation * Vector3.forward, camera.transform.rotation * Vector3.up);

            healthBarAmount.fillAmount = currentHealth / maxHealth;


            if (currentHealth <= 0)
            {
                Die();
            }
        }
        private void Die()
        {
            if(isPlayerUnit)
            {
                InputManager.Input_Handler.instance.selectedUnits.Remove(gameObject.transform.parent);
                Destroy(gameObject.transform.parent.gameObject);
            }
            else
            {
                Destroy(gameObject.transform.parent.gameObject);
            }
            
        }
    }
}
