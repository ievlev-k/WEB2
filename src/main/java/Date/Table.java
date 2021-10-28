package  Date;

public class Table {
    private final double x;
    private final double y;
    private final double r;

    private final boolean hit;

    public Table(double x, double y, double r, boolean hit) {

        this.hit = hit;
        this.r = r;
        this.y = y;
        this.x = x;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean getHit() {
        return hit;
    }

}