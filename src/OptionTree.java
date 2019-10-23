import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * OptionTree
 */
public class OptionTree {
    static OptionTree optionTreeInstance;
    OptionTreeNode root;
    OptionTreeNode current;

    class OptionTreeNode{
        String optionTitle;

        //option_name -> next node
        Map<String, OptionTreeNode> child;

        //at each level a node could facilitate query or none
        //TODO: 有空的话可以设计用于容错的query实例
        Optional<Query> query;

        OptionTreeNode(){
            child = new HashMap<>();
        }
        /**
         * Array of string describing the title of user inputs
         * 
         * @return
         * @throws Exception
         */
        public String[] inputOptions() throws Exception {
            if(query.isPresent())
                return query.get().userInputTitles;
            else throw new Exception("no such query scenario");
        }

        public void executeUserInput(String userInput[]){
            query.get().acceptUserInput(userInput);
        }

        public void moveToNext(String option) throws Exception {
            if(child.containsKey(option))
                current = child.get(option);
            else throw new Exception("no such option");
        }
    }

    OptionTree(){
        root = new OptionTreeNode();
        root.optionTitle = null;
        current = root;
        for(Query q : QueryList.queryList){
            buildBranch(q);
            restart();
        }
    }

    /**
     * the last node that is known to a query should store the query
     * @param query
     */
    private void buildBranch(Query query){
        for(String option : query.options){
            String pair[] = option.split("-");
            if(current.optionTitle == null)
                current.optionTitle = pair[0];
            current.child.putIfAbsent(pair[1], new OptionTreeNode());
            current = current.child.get(pair[1]);
        }
        //after the for loop the current pointer should point to the
        // last node known to the query
        current.query = Optional.of(query);
    }

    public static OptionTree getOptionTree(){
        if(optionTreeInstance == null)
            optionTreeInstance = new OptionTree();
        return optionTreeInstance;
    }

    public void restart(){
        current = root;
    }

    /**
     * @return the current
     */
    public OptionTreeNode getCurrent() {
        return current;
    }
}