package np.com.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import np.com.util.MyBatisCommonFactory;

public class TestDao {
	Logger logger = Logger.getLogger(TestDao.class);
	private static final String NAMESPACE = "np.mem.mybatis.TestMapper.";
	private SqlSessionFactory sqlMapper = null;
	
	// 싱글톤
	private static TestDao instanceDao = new TestDao();
	private TestDao() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
	}
	public static TestDao getInstance() {
		return instanceDao;
	}
	
	
	
	public List<Map<String,Object>> getTest(){
		List<Map<String,Object>> list = null;
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			list = session.selectList(NAMESPACE+"getTest");
			logger.info(list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}
