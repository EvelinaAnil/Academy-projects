public class Barbarian extends Character {
    public Barbarian(String name, int health) {
        super(name, health, DamageType.PHYSICAL);
    }

    public void attack(Character target) {
        int damage = calculateRandomDamage();
        damage = DamageCalc.calculateDamage(damage, damageType, target);
        target.health -= damage;
        System.out.println(name + " attacks " + target.name + " and lands " + damage + " points of damage.");
    }
}
