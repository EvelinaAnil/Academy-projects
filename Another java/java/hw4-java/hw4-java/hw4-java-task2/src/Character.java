import java.util.Random;

public abstract class Character implements IAttack{
    protected String name;
    protected int health;
    protected int minDamage;
    protected int maxDamage;
    protected DamageType damageType;

    protected boolean isCursed;

    public String getCharacterType() {
        return this.getClass().getSimpleName();
    }

    public String getName() {
        return name;
    }

    public Character(String name, int health,  DamageType damageType) {
        this.name = name;
        this.health = health;
        this.minDamage = 30;
        this.maxDamage = 70;
        this.damageType = damageType;
    }

    public boolean isAlive() {
        return health > 0;
    }

    protected int calculateRandomDamage() {
        Random rand = new Random();
        return rand.nextInt(maxDamage - minDamage + 1) + minDamage;
    }

    public boolean isDead() {
        return health <= 0;
    }

    public void curseChecker(){
        if (this.isCursed) {
            health -= 10;
        }
    }
}
