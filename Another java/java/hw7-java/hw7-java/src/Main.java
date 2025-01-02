public class Main {
    public static void main(String[] args) {
        Deck deck = new Deck();
        Card cardToRemove = new Card(Card.Suit.HEARTS, Card.Rank.ACE);
        Card cardToAdd = new Card(Card.Suit.HEARTS, Card.Rank.ACE);
        deck.printDeck();
        deck.removeCard(cardToRemove);
        deck.removeCard(cardToRemove);
        deck.addCard(cardToAdd);
        deck.addCard(cardToAdd);
        deck.shuffleDeck();
        deck.printDeck();
    }
}