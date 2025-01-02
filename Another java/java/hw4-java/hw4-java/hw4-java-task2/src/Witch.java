public class Witch extends Character {
    public Witch(String name, int health) {
        super(name, health, DamageType.MAGICAL);
    }
    @Override
    public void attack(Character target) {
        int damage = calculateRandomDamage();
        damage = DamageCalc.calculateDamage(damage, damageType, target);
        target.health -= damage;
        System.out.println(name + " attacks " + target.name + " and lands " + damage + " points of damage.");
    }
    public void curse(Character target) {
        target.isCursed = true;
        target.health -= 10;
        System.out.println(name + " Curses " + target.name + " and lands " + 10 + " points of damage.");
    }
}