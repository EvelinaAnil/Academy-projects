using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HealthBar : MonoBehaviour
{
    [SerializeField] private Image health;
    [SerializeField] private Health playerHealth;

    private float healthValue;
    private float currentHealth;
    [SerializeField] private float delta;

    private void Start()
    {
        healthValue = playerHealth.health / 100.0f;
    }

    private void Update()
    {
        currentHealth = playerHealth.health / 100.0f;

        if (currentHealth > healthValue)
        {
            healthValue += delta;
        }

        if (currentHealth < healthValue)
        {
            healthValue -= delta;
        }

        if (currentHealth < delta)
        {
            healthValue = currentHealth;
        }

        health.fillAmount = healthValue;
    }

}
