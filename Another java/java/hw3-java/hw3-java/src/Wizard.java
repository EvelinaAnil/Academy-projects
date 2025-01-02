public class Wizard extends Character {
    public Wizard(String name, int health) {
        super(name, health, DamageType.MAGICAL);
    }

    @Override
    public void attack(Character target) {
        int damage = calculateRandomDamage();
        damage = DamageCalc.calculateDamage(damage, damageType, target);
        target.health -= damage;
        System.out.println(name + " attacks " + target.name + " and lands " + damage + " points of damage.");
    }

    public void heal(Character target) {
        int healAmount = 50;
        target.health += healAmount;

        if (target.isCursed) {
            target.isCursed = false;
            System.out.println(name + " restores " + target.name + " by " + healAmount + " health.");
            System.out.println(target.name + " is freed from the curse.");
        } else
            System.out.println(name + " restores " + target.name + " by " + healAmount + " health.");
    }
}
