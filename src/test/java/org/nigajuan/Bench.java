package org.nigajuan;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.BeforeGroups;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Test;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * Created by IntelliJ IDEA.
 * User: nigajuan
 * Date: 16/02/11
 * Time: 20:47
 * To change this template use File | Settings | File Templates.
 */
public class Bench {

    private static final Logger logger = LoggerFactory.getLogger(Bench.class);

    private DecimalFormat df = new DecimalFormat();

    private static final String SEARCH = "SEARCH";
    private static final String EMPTY = "EMPTY";
    private static final String VALID = "VALID";

    private static final int WARM_UP = 2;

    public Bench() {
        df.setMaximumFractionDigits(6);
        df.setMinimumFractionDigits(6);
        df.setGroupingUsed(false);
        df.setDecimalSeparatorAlwaysShown(false);
    }


    @Test(groups = SEARCH , singleThreaded = true)
    public void benchSpring() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/spring/test/search.action?searchQuery=moto&_sacat=0&_odkw=test&_osacat=0&_trksid=", 500, 10, "benchSpring" , i != 0);
        }
    }

    @Test(groups = SEARCH , singleThreaded = true)
    public void benchPlayTomcat() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/play/?_nkw=moto&_sacat=0&_odkw=test&_osacat=0&_trksid=", 500, 10, "benchPlayTomcat" , i != 0);
        }
    }

    @Test(groups = SEARCH , singleThreaded = true)
    public void benchPlayEmbed() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:9000/?_nkw=moto&_sacat=0&_odkw=test&_osacat=0&_trksid=", 500, 10, "benchPlayEmbed" , i != 0);
        }
    }


    @Test(groups = EMPTY , singleThreaded = true)
    public void benchEmptySpring() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/spring/test/empty.action", 10000, 10, "benchEmptySpring" , i != 0);
        }
    }

    @Test(groups = EMPTY , singleThreaded = true)
    public void benchEmptyPlayTomcat() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/play/empty/empty", 10000, 10, "benchEmptyPlayTomcat" , i != 0);
        }
    }

    @Test(groups = EMPTY , singleThreaded = true)
    public void benchEmptyPlayEmbed() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:9000/empty/empty", 10000, 10, "benchEmptyPlayEmbed" , i != 0);
        }
    }


    @Test(groups = VALID , singleThreaded = true)
    public void benchValidSpring() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/spring/test/postComment.action?postId=1&author=author&comment=comment", 10000, 10, "benchValidSpring" , i != 0);
        }
    }

    @Test(groups = VALID , singleThreaded = true)
    public void benchValidPlayTomcat() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:7070/play/empty/postComment?postId=1&author=author&content=comment", 10000, 10, "benchValidPlayTomcat" , i != 0);
        }
    }

    @Test(groups = VALID , singleThreaded = true)
    public void benchValidPlayEmbed() throws Exception {
        for (int i = WARM_UP ; i >= 0 ; i--){
            bench("http://localhost:9000/empty/postComment?postId=1&author=author&content=comment", 10000, 10, "benchValidPlayEmbed" , i != 0);
        }
    }



    private void bench(String url, int nbIter, int nbThread, String log , boolean warmUp) throws Exception {
        for (int i = 1; i < nbThread; i++) {
            MeanCalculator meanCalculator;
            meanCalculator = launchRequestsThread(url, nbIter, false, i);
            if (!warmUp){
                StringBuilder builder = new StringBuilder();
                builder.append(log).append("\t Thread: ").append(i);
                builder.append("\t Response time: " + df.format(meanCalculator.mean()));
                builder.append("\t Request/s : " + df.format(1f / meanCalculator.mean()));
                builder.append("\t Request/s : " + df.format(i * 1f / meanCalculator.mean()));
                logger.info(builder.toString());
            }
        }
    }


    private MeanCalculator launchRequestsThread(final String url, final int iteration, final boolean clearCoockies, int nbThread) throws Exception {
        final MeanCalculator meanCalculator = new MeanCalculator();
        ExecutorService service = Executors.newFixedThreadPool(nbThread);
        for (int i = 0; i < nbThread; i++) {
            service.execute(new Thread() {
                @Override
                public void run() {
                    try {
                        requestPage(url, iteration, meanCalculator, clearCoockies);
                    } catch (Exception e) {
                        logger.error(e.getMessage(), e);
                    }
                }
            });
        }
        service.shutdown();
        service.awaitTermination(1, TimeUnit.HOURS);
        return meanCalculator;
    }

    private void requestPage(String url, int iteration, MeanCalculator meanCalculator, boolean clearCoockies) throws Exception {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        try {
            for (int i = 0; i < iteration; i++) {
                long start = System.nanoTime();
                HttpGet httpget = new HttpGet(url);
                ResponseHandler<byte[]> responseHandler = new ResponseHandler<byte[]>() {
                    @Override
                    public byte[] handleResponse(HttpResponse httpResponse) throws ClientProtocolException, IOException {
                        if (httpResponse.getStatusLine().getStatusCode() != 200){
                            logger.error("Error {}" , httpResponse.getStatusLine().getStatusCode());
                        }
                        return null;
                    }
                };
                httpclient.execute(httpget, responseHandler);
                float duration = (System.nanoTime() - start) * 1e-9f;
                meanCalculator.add(duration);
                if (clearCoockies) {
                    httpclient.getCookieStore().clear();
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        } finally {
            httpclient.getConnectionManager().shutdown();
        }
    }

}
