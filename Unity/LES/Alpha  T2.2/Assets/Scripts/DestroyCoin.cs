using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyCoin : MonoBehaviour
{
    [SerializeField] private Animator animator;
    [SerializeField] private GameObject domain;

    public void StartDestroy()
    {
        animator.SetTrigger("Start");
    }

    void EndDestroy()
    {
        Destroy(gameObject);
        Destroy(domain);
    }
}
