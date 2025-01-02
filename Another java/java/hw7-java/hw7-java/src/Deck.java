import java.util.Collections;
import java.util.LinkedList;
public class Deck {
    private LinkedList<Card> cards;
    public Deck() {
        cards = new LinkedList<>();
        initializeDeck();
    }
    public void printDeck() {
        for (Card card : cards) {
            System.out.println(card.toString());
        }
    }
    private void initializeDeck() {
        for (Card.Suit suit : Card.Suit.values()) {
            for (Card.Rank rank : Card.Rank.values()) {
                cards.add(new Card(suit, rank));
            }
        }
    }
    public void shuffleDeck() {
        Collections.shuffle(cards);
    }
    public void removeCard(Card card) {
        if (cards.contains(card)) {
            cards.remove(card);
            System.out.println("The card " + card + " has been removed from the deck.");
        } else {
            System.out.println("The card " + card + " is not found in the deck.");
        }
    }
    public void addCard(Card card) {
        if (cards.contains(card)) {
            System.out.println("The card " + card.toString() + " is already in the deck. Unable to add.");
        } else {
            cards.add(card);
            System.out.println("The card " + card.toString() + " has been added to the deck.");
        }
    }
}
