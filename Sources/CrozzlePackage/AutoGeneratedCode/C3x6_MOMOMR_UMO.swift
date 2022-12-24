public class C3x6_MOMOMR_UMO {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for middlex1 in 0..<wordCount {

                        if (W.Len[middlex1] == interlockWidth &&
                            W.Start[middlex1][0] == W.End[up1][5] &&
                            W.Id[middlex1] != W.Id[up1]) {
                            //print("middlex1:\(W.Start[middlex1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.Start[middlex1][1] &&
                                    W.Id[middley2] != W.Id[middlex1] &&
                                    W.Id[middley2] != W.Id[up1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for outerx2 in 0..<wordCount {

                                        if W.Len[outerx2] >= interlockWidth + 2 {

                                            let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                            for outerx2Pos in 1..<outerx2Limit {

                                                if (W.Start[outerx2][outerx2Pos + 0] == W.End[up1][4] &&
                                                W.Start[outerx2][outerx2Pos + 1] == W.Start[middley2][1] &&
                                                W.Id[outerx2] != W.Id[middley2] &&
                                                W.Id[outerx2] != W.Id[middlex1] &&
                                                W.Id[outerx2] != W.Id[up1]) {
                                                    //print("outerx2:\(W.Start[outerx2])")

                                                    for outery3 in 0..<wordCount {

                                                        if W.Len[outery3] >= interlockHeight + 2 {

                                                            let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                            for outery3Pos in 1..<outery3Limit {

                                                                if (W.Start[outery3][outery3Pos + 0] == W.Start[middlex1][2] &&
                                                                W.Start[outery3][outery3Pos + 1] == W.Start[outerx2][outerx2Pos + 2] &&
                                                                W.Id[outery3] != W.Id[outerx2] &&
                                                                W.Id[outery3] != W.Id[middley2] &&
                                                                W.Id[outery3] != W.Id[middlex1] &&
                                                                W.Id[outery3] != W.Id[up1]) {
                                                                    //print("outery3:\(W.Start[outery3])")

                                                                    for middlex3 in 0..<wordCount {

                                                                        if (W.Len[middlex3] == interlockWidth &&
                                                                            W.Start[middlex3][0] == W.End[up1][3] &&
                                                                            W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                            W.Start[middlex3][2] == W.Start[outery3][outery3Pos + 2] &&
                                                                            W.Id[middlex3] != W.Id[outery3] &&
                                                                            W.Id[middlex3] != W.Id[outerx2] &&
                                                                            W.Id[middlex3] != W.Id[middley2] &&
                                                                            W.Id[middlex3] != W.Id[middlex1] &&
                                                                            W.Id[middlex3] != W.Id[up1]) {
                                                                            //print("middlex3:\(W.Start[middlex3])")

                                                                            for outerx4 in 0..<wordCount {

                                                                                if W.Len[outerx4] >= interlockWidth + 2 {

                                                                                    let outerx4Limit = Int(W.Len[outerx4]) - Int(interlockWidth)
                                                                                    for outerx4Pos in 1..<outerx4Limit {

                                                                                        if (W.Start[outerx4][outerx4Pos + 0] == W.End[up1][2] &&
                                                                                        W.Start[outerx4][outerx4Pos + 1] == W.Start[middley2][3] &&
                                                                                        W.Start[outerx4][outerx4Pos + 2] == W.Start[outery3][outery3Pos + 3] &&
                                                                                        W.Id[outerx4] != W.Id[middlex3] &&
                                                                                        W.Id[outerx4] != W.Id[outery3] &&
                                                                                        W.Id[outerx4] != W.Id[outerx2] &&
                                                                                        W.Id[outerx4] != W.Id[middley2] &&
                                                                                        W.Id[outerx4] != W.Id[middlex1] &&
                                                                                        W.Id[outerx4] != W.Id[up1]) {
                                                                                            //print("outerx4:\(W.Start[outerx4])")

                                                                                            for middlex5 in 0..<wordCount {

                                                                                                if (W.Len[middlex5] == interlockWidth &&
                                                                                                    W.Start[middlex5][0] == W.End[up1][1] &&
                                                                                                    W.Start[middlex5][1] == W.Start[middley2][4] &&
                                                                                                    W.Start[middlex5][2] == W.Start[outery3][outery3Pos + 4] &&
                                                                                                    W.Id[middlex5] != W.Id[outerx4] &&
                                                                                                    W.Id[middlex5] != W.Id[middlex3] &&
                                                                                                    W.Id[middlex5] != W.Id[outery3] &&
                                                                                                    W.Id[middlex5] != W.Id[outerx2] &&
                                                                                                    W.Id[middlex5] != W.Id[middley2] &&
                                                                                                    W.Id[middlex5] != W.Id[middlex1] &&
                                                                                                    W.Id[middlex5] != W.Id[up1]) {
                                                                                                    //print("middlex5:\(W.Start[middlex5])")

                                                                                                    for right6 in 0..<wordCount {

                                                                                                        if (W.Len[right6] >= interlockWidth &&
                                                                                                            W.Start[right6][0] == W.End[up1][0] &&
                                                                                                            W.Start[right6][1] == W.Start[middley2][5] &&
                                                                                                            W.Start[right6][2] == W.Start[outery3][outery3Pos + 5] &&
                                                                                                            W.Id[right6] != W.Id[middlex5] &&
                                                                                                            W.Id[right6] != W.Id[outerx4] &&
                                                                                                            W.Id[right6] != W.Id[middlex3] &&
                                                                                                            W.Id[right6] != W.Id[outery3] &&
                                                                                                            W.Id[right6] != W.Id[outerx2] &&
                                                                                                            W.Id[right6] != W.Id[middley2] &&
                                                                                                            W.Id[right6] != W.Id[middlex1] &&
                                                                                                            W.Id[right6] != W.Id[up1]) {
                                                                                                            //print("right6:\(W.Start[right6])")

                                                                                                            if phase == 0 {
                                                                                                                shapeCount += 1
                                                                                                            }
                                                                                                            else {
                                                                                                                outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                                                outerStart[index + 3] = UInt8(outerx4Pos)

                                                                                                                outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, outerx4, middlex5, right6, up1, middley2, outery3])
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.middle, .outer, .middle, .outer, .middle, .trailing],
            patternVertical: [.leading, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}