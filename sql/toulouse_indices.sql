CREATE INDEX idx_nodes_tags ON nodes USING GIN(tags);
CREATE INDEX idx_ways_tags ON ways USING GIN(tags);
CREATE INDEX idx_relations_tags ON relations USING GIN(tags);
