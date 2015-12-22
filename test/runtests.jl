#= Copyright 2015 Fengyang Wang

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License. =#

using English
using Base.Test

@testset "Articles" begin
    @test indefinite("pig") == "a"
    @test indefinite("iron") == "an"
    @test indefinite("unicorn") == "a"
    @test indefinite("honest") == "an"
    @test indefinite("honey") == "a"
    @test indefinite("NATO") == "a"
    @test indefinite("NSA") == "an"
end
