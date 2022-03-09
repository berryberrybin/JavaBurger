package dao;

import dto.OrderOption;
import dto.OrderProduct;
import dto.Payment;
import service.OrderOptionService;
import utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderProductDAOImpl implements OrderProductDAO {
	OrderOptionService orderOptionService = new OrderOptionService();
	ProductDAO productDAO = new ProductDAOImpl();

    @Override
    public List<OrderProduct> selectOrderProducts() throws SQLException {
        return null;
    }

    @Override
    public OrderProduct selectOrderProductByNumber(int orderProductNo) throws SQLException {
        return null;
    }

    @Override
    public int[] insertOrderProduct(Connection con ,Payment payment) throws SQLException {
        PreparedStatement ps = null;
        String sql = "insert into orderproduct values (ORDER_PRD_NO_SEQ.nextval, PAY_NO_SEQ.currval,?,?)";
    	int result []=null;
    	
    	try {
    		
    		ps =con.prepareStatement(sql);
    		for(OrderProduct order : payment.getOrderList()) {
    			/*이거 없어도 작동 잘 되면 삭제하기
    			 * Product product = productDAO.selectProductByProductNumber(order.getProductNumber());*/
    			
    			ps.setInt(1, order.getProductNumber());
    			ps.setInt(2, order.getOrderProductAmount());
    			ps.addBatch();
    			
    			List<OrderOption> orderop= order.getOrderoptionlist();
    			if(orderop!=null) {
    				orderOptionService.insertOrderOption(con,order);
    			}
    			ps.clearParameters();
    		}
    		result =ps.executeBatch();
    		
    	}finally {
    		DbUtils.close(null, ps);
    	}
    	return result;
    }

    @Override
    public int deleteOrderProduct(int orderProductNo) throws SQLException {
        return 0;
    }

    @Override
    public int updateOrderProduct(OrderProduct orderProduct) throws SQLException {
        return 0;
    }
}
