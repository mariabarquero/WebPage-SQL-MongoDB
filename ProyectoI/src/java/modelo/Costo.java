package modelo;

public class Costo {
        int Subtotal;
        int Total;
        int Descuento;    

        public Costo(){
        }

        public Costo(int Subtotal, int Total, int Descuento) {
            this.Subtotal = Subtotal;
            this.Total = Total;
            this.Descuento = Descuento;
        }

    public int getSubtotal() {
        return Subtotal;
    }

    public int getTotal() {
        return Total;
    }

    public int getDescuento() {
        return Descuento;
    }

    public void setSubtotal(int Subtotal) {
        this.Subtotal = Subtotal;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

    public void setDescuento(int Descuento) {
        this.Descuento = Descuento;
    }
}

