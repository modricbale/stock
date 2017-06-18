package com.stock.utils;
import java.io.File;
import java.util.ArrayList;
import java.util.List; 
import org.apache.mahout.cf.taste.impl.common.FastByIDMap; 
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator; 
import org.apache.mahout.cf.taste.impl.model.GenericDataModel; 
import org.apache.mahout.cf.taste.impl.model.GenericPreference; 
import org.apache.mahout.cf.taste.impl.model.GenericUserPreferenceArray; 
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel; 
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood; 
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender; 
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender; 
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity; 
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity; 
import org.apache.mahout.cf.taste.model.DataModel; 
import org.apache.mahout.cf.taste.model.PreferenceArray; 
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood; 
import org.apache.mahout.cf.taste.recommender.RecommendedItem; 
import org.apache.mahout.cf.taste.recommender.Recommender; 
import org.apache.mahout.cf.taste.similarity.ItemSimilarity; 
import org.apache.mahout.cf.taste.similarity.UserSimilarity; 

public class RecommenderCollect { 
//	public static void main(String[] args) throws Exception {
//	CFDemo(7); 
//} 

	/** * * @throws Exception */ 
	public static List<Integer> CFDemo(Integer user_id) throws Exception { 

		//�����ļ���dataModel 
	    DataModel model = new FileDataModel(new File("F:/testCF.csv")); 
        //�������ݵġ�ŷ�Ͼ��롢����ڵ�Эͬ�����㷨 
        ItemSimilarity similarity1 = new EuclideanDistanceSimilarity(model); 
        Recommender recommender1 = new GenericItemBasedRecommender(model,similarity1);
        
		//��ӡ�û�user���Ƽ���Ϣ
        List<RecommendedItem> recommendations = recommender1.recommend(user_id, 5); 
        ArrayList<Integer>arrayList = new ArrayList<Integer>();
        for (RecommendedItem recommendation : recommendations) { 
        	System.out.println((int)recommendation.getItemID()); 
        	arrayList.add((int)recommendation.getItemID());
        	} 
        
//          LongPrimitiveIterator iter1 = model.getUserIDs(); while (iter1.hasNext()) {
//        	long uid = iter1.nextLong();
//        	List<RecommendedItem> list = recommender1.recommend(uid, 5); 
//        	System.out.printf("uid:%s", uid); 
//        	for (RecommendedItem ritem : list) { 
//        		System.out.printf("(%s,%f)", ritem.getItemID(), ritem.getValue());
//        		} 
//        	System.out.println();
//        	}
          return arrayList;
	}
}