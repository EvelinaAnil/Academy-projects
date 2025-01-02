public class Card {
    public enum Suit {
        HEARTS('♥'), DIAMONDS('♦'), CLUBS('♣'), SPADES('♠');

        private final char symbol;

        Suit(char symbol) {
            this.symbol = symbol;
        }

        public char getSymbol() {
            return symbol;
        }
    }
    public enum Rank {
        TWO(2), THREE(3), FOUR(4), FIVE(5),
        SIX(6), SEVEN(7), EIGHT(8), NINE(9),
        TEN(10), JACK(10), QUEEN(10), KING(10),
        ACE(10);

        private final int value;

        Rank(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    public Suit suit;
    public Rank rank;
    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
    }
    public String toString() {
        String rankString;
        if (rank.getValue() >= 2 && rank.getValue() < 10 || rank == Rank.TEN) {
            rankString = String.valueOf(rank.getValue());
        } else {
            rankString = String.valueOf(rank.name().charAt(0));
        }
        return rankString + suit.getSymbol();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Card otherCard = (Card) obj;
        return suit == otherCard.suit && rank == otherCard.rank;
    }
}
