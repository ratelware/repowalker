package com.ratelware.execution;

import com.ratelware.database.DocumentDatabase;
import com.ratelware.metrics.MetricsCollector;
import com.ratelware.platforms.SourcePlatform;
import com.ratelware.scenario.MaterializedScenario;
import com.ratelware.scenario.StrollScenario;
import com.ratelware.storage.BlobStorage;

public class ScenarioDriver {

    private final MetricsCollector collector;
    private final BlobStorage storage;
    private final DocumentDatabase db;
    private final SourcePlatform platform;

    ScenarioDriver(MetricsCollector collector, BlobStorage storage, DocumentDatabase db, SourcePlatform platform) {
        this.collector = collector;
        this.storage = storage;
        this.db = db;
        this.platform = platform;
    }

    void fetch(StrollScenario s) {
        if(!platform.supports(s)) {
            throw new RuntimeException("Scenario " + s.name() + " is not supported for platform " + platform.name());
        }

        MaterializedScenario scenario = platform.materialize(s);



    }
}
