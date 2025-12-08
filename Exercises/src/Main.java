public class Main {
    public static void main(String... args) {
        Yusha Player1 = new Yusha();
        Wizard Player2 = new Wizard();

        callHit(Player1);
        callHit(Player2);
    }

    private static void callHit(Job j) {
        j.hit();
    }
}

class Job {
    public void hit() {
        System.out.println("100のダメージ");
    }
}

class Yusha extends Job {
    public void hit() {
        System.out.println("80のダメージ");
    }
}

class Wizard extends Job {
    public void hit() {
        System.out.println("120のダメージ");
    }
}
