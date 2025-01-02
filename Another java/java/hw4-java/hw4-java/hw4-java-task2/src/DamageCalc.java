public class DamageCalc {
    public static int calculateDamage(int baseDamage, DamageType damageType, Character target) {
        int finalDamage = baseDamage;
        switch (damageType) {
            case PHYSICAL:
                if (target instanceof Wizard || target instanceof Witch) {
                    finalDamage += 10;
                }
                break;
            case MAGICAL:
                if (target instanceof Barbarian) {
                    finalDamage += 10;
                }
                break;
        }
        return finalDamage;
    }
}

