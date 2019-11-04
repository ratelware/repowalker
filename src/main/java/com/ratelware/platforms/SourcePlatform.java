package com.ratelware.platforms;

import com.ratelware.scenario.MaterializedScenario;
import com.ratelware.scenario.StrollScenario;

public interface SourcePlatform {
    String name();
    boolean supports(StrollScenario scenario);
    MaterializedScenario materialize(StrollScenario scenario);
}
