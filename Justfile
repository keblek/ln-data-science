blockheight := `lncli --rpcserver=192.168.178.122:10009 --macaroonpath=~/.lnd/raspi/admin.macaroon --tlscertpath=~/.lnd/raspi/tls.cert getinfo | jq -r ".block_height"`
rundocker:
    echo "opt/conda/bin/jupyter notebook --notebook-dir=/data --ip='*' --port=8888 --no-browser --allow-root"
    docker run -i -t -v /Users/matthiasdebernardini/gits/networkx-tutorial-jupyter/data/:/data -p 8888:8888 networkxln/notebook
parseedges:
   jq -r '.edges | .[] | [.node1_pub,.node2_pub,.capacity,.channel_id] | @csv' describegraph-polar.json
getgraph:
    lncli --rpcserver=192.168.178.122:10009 --macaroonpath=~/.lnd/raspi/admin.macaroon --tlscertpath=~/.lnd/raspi/tls.cert describegraph >> ~/gits/ln-data-science/data/graphs/{{blockheight}}


