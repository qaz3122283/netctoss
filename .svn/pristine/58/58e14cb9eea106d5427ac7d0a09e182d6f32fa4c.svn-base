/**
 * 
 */
package group7netctoss.entity;

/**
 * 页码显示的类
 * @author Administrator
 *
 */
public class PageCount {
	private int pageSize = 2;
	private int TotlePage;
	private int curPage = 1;
	private int middle = 3;
	private int totleNumber;
	private int width = 2;
	private int index;
	/**
	 * 
	 */
	public PageCount() {
		super();
	}
	
	/**
	 * @param pageSize
	 * @param curPage
	 */
	public PageCount(int pageSize, int curPage) {
		super();
		this.pageSize = pageSize;
		this.curPage = curPage;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totlePage
	 */
	public int getTotlePage() {
		return TotlePage;
	}

	/**
	 * @param totlePage the totlePage to set
	 */
	public void setTotlePage(int totlePage) {
		TotlePage = totlePage;
	}

	/**
	 * @return the curPage
	 */
	public int getCurPage() {
		return curPage;
	}

	/**
	 * @param curPage the curPage to set
	 */
	public void setCurPage(int curPage) {
		this.curPage = curPage;
		if(curPage>0)
			this.setIndex((curPage-1)*pageSize);
		else
			this.setIndex(0);
	}

	/**
	 * @return the middle
	 */
	public int getMiddle() {
		return middle;
	}

	/**
	 * @param middle the middle to set
	 */
	public void setMiddle(int middle) {
		this.middle = middle;
	}



	/**
	 * @return the totleNumber
	 */
	public int getTotleNumber() {
		return totleNumber;
	}

	/**
	 * @param totleNumber the totleNumber to set
	 */
	public void setTotleNumber(int totleNumber) {
		this.totleNumber = totleNumber;
		if(totleNumber>pageSize)
			this.setTotlePage((totleNumber%pageSize==0)?(totleNumber/pageSize):((totleNumber/pageSize)+1));
		else
			this.setTotlePage(1);
	}

	/**
	 * @return the width
	 */
	public int getWidth() {
		return width;
	}

	/**
	 * @param width the width to set
	 */
	public void setWidth(int width) {
		this.width = width;
	}

	/**
	 * @return the index
	 */
	public int getIndex() {
		return index;
	}

	/**
	 * @param index the index to set
	 */
	public void setIndex(int index) {
		this.index = index;
	}

	public static void setting(PageCount pc){
		int m = pc.getMiddle();
		int c = pc.getCurPage();
		int w = pc.getWidth();
		int p = pc.getTotlePage();
		if(c>=m+w&&c<=p-w) pc.setMiddle(c);
		if(c>p-w) pc.setMiddle(p-w);
		if(c<=m-w&&c>=w) pc.setMiddle(c);
		if(c<w) pc.setMiddle(w+1);
	}

	
}
