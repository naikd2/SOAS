


            <ul class="list-group">
                <li class="list-group-item">
                    ${course.name}
                </li>
                <li class="list-group-item">
                    ${course.offered}: ${course.units}
                </li>
                <li class="list-group-item">
                    ${course.description}
                </li>
                <li class="list-group-item">Objectives:</li>
                <li class="list-group-item">
                    <g:each in="${course.objectives}" status="i" var="o">
                            <dl>
                                <dt><span class="property-value" aria-labelledby="objectives-label">${o?.encodeAsHTML()}</span></dt>

                                <div>
                                    <h5>Introduce Outcomes</h5>
                                    <g:each in="${o.introduceOutcomes}" var="intro">
                                        <div>
                                            <span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
                                        </div>
                                    </g:each>
                                </div>
                                <div>
                                    <h5>Reinforce Outcomes</h5>
                                    <g:each in="${o.reinforceOutcomes}" var="rein">
                                        <div>
                                            <span class="property-value" aria-labelledby="articles-label">${rein?.encodeAsHTML()}</span>
                                        </div>
                                    </g:each>
                                </div>
                                <div>
                                    <h5>Emphasize Outcomes</h5>
                                    <g:each in="${o.emphasizeOutcomes}" var="emph">
                                        <div>
                                            <span class="property-value" aria-labelledby="articles-label">${emph?.encodeAsHTML()}</span>
                                        </div>
                                    </g:each>
                                </div>
                            </dl>
                    </g:each>
                </li>
            </ul>
