import axios from "axios";

export async function subgraphQuery(query) {
    try {
        // Replace YOUR-SUBGRAPH-URL with the URL of your subgraph
        const SUBGRAPH_URL = "https://api.thegraph.com/subgraphs/name/tsuhito/learnweb3";
        const response = await axios.post(SUBGRAPH_URL, { query,});
        if (response.data.errors) {
            console.error(response.data.errors);
            throw new Error(`Error makin subgraph query ${response.data.errors}`);
        }
        return response.data.data;
    } catch (error) {
        console.error(error);
        throw new Error(`Could not query the subgraph ${erorr.message}`);
    }
}